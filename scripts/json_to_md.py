import json
import sys

def convert_json_to_markdown():
    with open("src/default_docs.json", "r") as f:
        data = json.load(f)

    with open("gamesense_api.md", "w") as out:
        out.write("# Gamesense Lua API Documentation\n\n")

        for namespace, functions in data.items():
            out.write(f"## {namespace}\n\n")

            for func_name, func_data in functions.items():
                call_signature = func_data.get("name", f"{namespace}.{func_name}")

                args = func_data.get("args", [])
                arg_strs = []
                for arg in args:
                    arg_strs.append(arg.get("name", ""))

                out.write(f"### `{call_signature}({', '.join(arg_strs)})`\n")

                if "description" in func_data:
                    out.write(f"> {func_data['description']}\n\n")

                if args:
                    out.write("**Arguments:**\n")
                    for arg in args:
                        desc = arg.get("description", "No description provided.")
                        out.write(f"- `{arg.get('name')}`: {desc}\n")
                out.write("\n---\n\n")

if __name__ == "__main__":
    convert_json_to_markdown()