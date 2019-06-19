---
layout: post
title: Networking neutron concepts
date: 2019-06-19 05:12:08 +0900
categories: [Openstack]
tags: [Openstack, Neutron]
---
Openstack Networking ([neutron]) 은 Openstack 환경의 VNI (Virtual Networking infrastructure) networking 과 PNI (Physical Networking infrastructure) access layer를 관리한다. 또한 Openstack Networking은 firewall, load balancer, virtual private network (VPN) 등을 이용해서, 프로젝트 별로 더 나은 네트워크 토폴로지 (Network Topology) 를 구성할 수 있게 해준다.
<!--more-->

여기서 말하는 Networking이란 network, subnet, router등을 추상화한것이며, 

[neutron]: https://docs.openstack.org/neutron/latest/index.html
