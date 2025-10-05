def commands(binary_str):
    actions = ["Reverse", "jump", "close your eyes", "double blink", "wink"][::-1]

    action_seq = []
    for k, b in enumerate(binary_str[::-1]):
        if b == "1" and actions[k] == "Reverse":
            action_seq = action_seq[::-1]
            continue
        elif b == "1":
            action_seq.append(actions[int(k)])

    return action_seq
