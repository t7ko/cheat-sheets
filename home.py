#!/usr/bin/python3

# Usage:
# find . -name '*.md' | home.py >> home.md

import sys

def read_input():
  lines = sys.stdin.readlines()
  lines = map(lambda x: x.rstrip(), lines )
  lines = list(lines)
  lines.sort()
  return tuple(lines)

def get_slug(file_name):
  slug = file_name
  if slug.endswith('.md'):
    slug = slug[:-3]
  if slug.startswith('./'):
    slug = slug[2:]
  return slug

def get_name(slug):
  return slug.replace('-', ' ')

def gen_tree(file_names):
  tree = {}
  for file_name in file_names:
    slug = get_slug(file_name)
    path = slug.split('/')
    branches = path[:-1]
    leaf = path[-1]
    subtree = tree
    for branch in branches:
      if branch not in subtree:
        subtree[branch] = {}
      subtree = subtree[branch]
    try:
      subtree[leaf] = slug
    except:
      print('Problem with page:', file_name)
      print('Probably, name of some parent folder is the same as name of some .md page on the same hierarchy level.')
      raise
  return tree

def print_index(file_names):
  print('## Index\n')
  for file_name in file_names:
    slug = get_slug(file_name)
    name = get_name(slug)
    print('* [' + name + '](' + slug + ')')
  print('\n')

def print_tree(tree):
  print('## Tree\n')
  print_subtree(tree, 0)
  print('\n')

def print_subtree(tree, level = 0):
  prefix = ('  ' * level) + '* '
  for node,children in tree.items():
    if isinstance(children, str):
      print( prefix + '[' + get_name(node) + '](' + children + ')' )
    else:
      print( prefix + node )
      print_subtree(children, level + 1)

def print_categories(tree):
  print('## Categories')
  leafs = {}
  for node,children in tree.items():
    if isinstance(children, str):
      leafs[node] = children
    else:
      print( '\n### ' + get_name(node) + '\n' )
      print_subtree(children, 0)
  print('\n### ROOT\n')
  print_subtree(leafs, 0)
  print('\n')

def main():
  file_names = read_input()
  tree = gen_tree(file_names)
  print_index(file_names)
  print_tree(tree)
  print_categories(tree)

if __name__ == '__main__':
  main()

