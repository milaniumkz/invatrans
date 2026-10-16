"""Run against the isolated demo-invatrans-test Firebase emulators only."""
import json
import urllib.error
import urllib.request

PROJECT = 'demo-invatrans-test'
AUTH = 'http://127.0.0.1:19099'
DB = f'http://127.0.0.1:18080/v1/projects/{PROJECT}/databases/(default)/documents'
results = []


def request(url, data=None, token=None, method=None, content_type='application/json'):
    headers = {'Content-Type': content_type}
    if token:
        headers['Authorization'] = 'Bearer ' + token
    body = data if isinstance(data, bytes) else json.dumps(data).encode() if data is not None else None
    req = urllib.request.Request(url, data=body, headers=headers, method=method)
    try:
        with urllib.request.urlopen(req, timeout=20) as response:
            status, payload = response.status, response.read()
    except urllib.error.HTTPError as error:
        status, payload = error.code, error.read()
    try:
        payload = json.loads(payload)
    except ValueError:
        pass
    return status, payload


def check(name, status, expected):
    passed = status == expected
    results.append({'name': name, 'passed': passed, 'actual': status, 'expected': expected})
    print(f'{"PASS" if passed else "FAIL"}: {name} (HTTP {status}, expected {expected})')


def phone_login(phone):
    status, sent = request(AUTH + '/identitytoolkit.googleapis.com/v1/accounts:sendVerificationCode?key=test',
                           {'phoneNumber': phone, 'recaptchaToken': 'test'})
    assert status == 200, sent
    _, codes = request(AUTH + f'/emulator/v1/projects/{PROJECT}/verificationCodes')
    code = next(item['code'] for item in codes['verificationCodes'] if item['sessionInfo'] == sent['sessionInfo'])
    status, user = request(AUTH + '/identitytoolkit.googleapis.com/v1/accounts:signInWithPhoneNumber?key=test',
                           {'sessionInfo': sent['sessionInfo'], 'code': code})
    check('Firebase phone login and token issuance', status, 200)
    return user['localId'], user['idToken']


def ref(path):
    return {'referenceValue': f'projects/{PROJECT}/databases/(default)/documents/{path}'}


def document(path, fields, token):
    return request(DB + '/' + path, {'fields': fields}, token, 'PATCH')


if __name__ == '__main__':
    status, _ = request(f'http://127.0.0.1:18080/emulator/v1/projects/{PROJECT}/databases/(default)/documents', method='DELETE')
    assert status == 200, 'Could not reset isolated demo database'
    uid_a, token_a = phone_login('+16505550101')
    uid_b, token_b = phone_login('+16505550102')
    user_a, user_b = 'users/' + uid_a, 'users/' + uid_b
    for user, token in [(user_a, token_a), (user_b, token_b)]:
        status, _ = document(user, {'display_name': {'stringValue': 'Test User'}}, token)
        check('Create own profile', status, 200)
    status, _ = request(DB + '/' + user_a, token=token_a)
    check('Read own profile', status, 200)
    status, _ = document(user_a, {'display_name': {'stringValue': 'Updated User'}}, token_a)
    check('Update own profile', status, 200)
    status, _ = document('order/test-order', {'idUser': ref(user_a), 'status': {'integerValue': '0'}}, token_a)
    check('Create passenger order', status, 200)
    status, _ = document('order/test-order', {'status': {'integerValue': '1'}}, token_a)
    check('Update passenger order', status, 200)
    status, _ = request(DB + '/order/test-order', token=token_b)
    check('Driver reads order', status, 200)
    status, _ = document('bid/test-bid', {'idOrder': ref('order/test-order'), 'idDriver': ref(user_b),
                                       'price': {'doubleValue': 1500}, 'status': {'integerValue': '0'}}, token_b)
    check('Driver submits bid', status, 200)
    status, _ = document('order/test-order', {'status': {'integerValue': '1'}, 'idDriver': ref(user_b)}, token_a)
    check('Passenger accepts driver', status, 200)
    status, _ = document('uslugi/test-service', {'idUser': ref(user_a), 'title': {'stringValue': 'Test service'}}, token_a)
    check('Publish service', status, 200)
    status, _ = request(DB + '/uslugi/test-service', token=token_b)
    check('Other user reads service', status, 200)
    status, _ = document('card/test-item', {'idUser': ref(user_a), 'status': {'stringValue': '0'}}, token_a)
    check('Add cart item', status, 200)
    status, _ = document('chats/test-chat', {'users': {'arrayValue': {'values': [ref(user_a), ref(user_b)]}},
                                         'user_a': ref(user_a), 'user_b': ref(user_b)}, token_a)
    check('Create chat between users', status, 200)
    status, _ = request(DB + '/chats/test-chat', token=token_b)
    check('Other participant reads chat', status, 200)
    status, _ = document('chat_messages/test-message', {'chat': ref('chats/test-chat'),
                                                      'user': ref(user_a), 'text': {'stringValue': 'Test'}}, token_a)
    check('Send chat message', status, 200)
    status, _ = request(DB + '/chat_messages/test-message', token=token_b)
    check('Other participant reads message', status, 200)
    uid_c, token_c = phone_login('+16505550103')
    status, _ = request(DB + '/chat_messages/test-message', token=token_c)
    check('Reject outsider reading chat message', status, 403)
    status, _ = request(DB + '/' + user_b, token=token_a)
    check('Load chat participant profile (required by current app)', status, 200)
    status, _ = document('order/unauthorized-order', {'status': {'integerValue': '0'}}, None)
    check('Reject unauthenticated order creation', status, 403)
    status, _ = document('menu/unauthorized-item', {'title': {'stringValue': 'Unauthorized'}}, None)
    check('Reject unauthenticated menu changes', status, 403)
    upload = f'http://127.0.0.1:19199/v0/b/{PROJECT}.appspot.com/o?uploadType=media&name=users%2F{uid_a}%2Ftest.txt'
    status, _ = request(upload, b'test profile file', token_a, 'POST', 'text/plain')
    check('Upload own profile file', status, 200)
    status, _ = request(upload, b'unauthorized replacement', token_b, 'POST', 'text/plain')
    check('Reject another user replacing profile file', status, 403)
    print(json.dumps(results, ensure_ascii=False, indent=2))
    raise SystemExit(1 if any(not result['passed'] for result in results) else 0)
