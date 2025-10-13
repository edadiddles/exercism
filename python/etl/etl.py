def transform(legacy_data):
    mod_data = {}
    for k,v in legacy_data.items():
        for n in v:
            mod_data[n.lower()] = k

    return mod_data
