#!/bin/sh

ansible-playbook settingup_kubernetes_cluster.yml

anslible-playbook join_kubernetes_workers_nodes.yml