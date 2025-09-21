# list recipes
@default:
   just --list

# run setup
setup:
   bash setup.sh

# run ansible-lint
lint:
    (cd ansible && ansible-lint --fix)

# run playbook
run:
    (cd ansible && ansible-playbook main.yml -K)
