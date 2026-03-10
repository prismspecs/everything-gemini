import os
import glob
import re

def convert_file(filepath, dest_dir):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Extract frontmatter
    match = re.match(r'^---\n(.*?)\n---\n(.*)$', content, re.DOTALL)
    if match:
        frontmatter = match.group(1)
        body = match.group(2).strip()
        
        # simple parsing of yaml frontmatter
        metadata = {}
        for line in frontmatter.split('\n'):
            if ':' in line:
                key, val = line.split(':', 1)
                # handle quotes in description
                metadata[key.strip()] = val.strip().strip('"').strip("'")
    else:
        metadata = {}
        body = content.strip()

    description = metadata.get('description', 'No description provided.')
    # remove double quotes inside description to prevent breaking toml string
    description = description.replace('"', '\"')

    # Get base name for the command
    if 'SKILL.md' in filepath:
        name = os.path.basename(os.path.dirname(filepath))
    else:
        name = os.path.splitext(os.path.basename(filepath))[0]

    dest_path = os.path.join(dest_dir, f"{name}.toml")

    # Format the prompt, escaping triple quotes
    prompt = body.replace('"""', '"""')
    
    toml_content = f'description = "{description}"\nprompt = """\n' + prompt + '\n"""\n'

    with open(dest_path, 'w', encoding='utf-8') as f:
        f.write(toml_content)

# create destination dir
os.makedirs('gemini-commands', exist_ok=True)

for md_file in glob.glob('commands/*.md'):
    convert_file(md_file, 'gemini-commands')

for skill_file in glob.glob('skills/*/SKILL.md'):
    convert_file(skill_file, 'gemini-commands')

print(f"Conversion complete. Created {len(os.listdir('gemini-commands'))} toml files.")