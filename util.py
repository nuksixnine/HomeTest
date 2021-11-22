import base64

def encode_header_transfer(input_str):
    message_bytes = input_str.encode('ascii')
    base64_bytes = base64.b64encode(message_bytes)
    base64_message = base64_bytes.decode('ascii')
    return base64_message