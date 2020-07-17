---
layout: post
title: Google IT Support Certification 과정
date: 2020-01-31
categories: [network]
tags: [certification]
---
### 물리 계층 (Physical Layer)
물리 계층은 이름 그대로 컴퓨터들이 서로 네트워크가 가능하게 연결해주는 물리적인 하드웨어들로 구성이 되어있다.

### 데이터 링크 계층 (Data Link Layer)
데이터 링크 계층은 다른말로 network interface 혹은 network access 계층이라고 부르기도 하며, 물리 계층에서 주고 받은 전기 신호를 적절하게 해석하여 (interpreting) 네트워크 장치들이 대화 (communicate) 할수있게 해준다. 대표적인 프로토콜로는 Ethernet이 존재한다.
>**Ethernet** - 주로 LAN, MAN, WAN에서 가장 많이 쓰이는 규격, 프로토콜이며 데이터 링크 계층에서 **MAC** 주소를 기준으로 상호간에 데이터를 주고 받을 수 있도록 만들어졌다.

### 네트워크 계층 (Network Layer)
네트워크 계층은 Internet Layer라고도 불리며, 라우터 (router)라는 장치를 통해서 다른 네트워크와 연결되게 해준다. 라우터들을 통해 연결된 네트워크 집합을 다른말로 오늘날 우리가 말하는 인터넷이다. 데이터 링크 계층에서는 장치와 장치 (device to device)의 single link를 통해서 데이터를 주고 받았다면, 네트워크 계층에선 라우터를 통해서 네트워크에서 다른 네트워크까지 (network to network)를 가능하게 해준다. 가장 널리 사용되는 프로토콜은 흔히 알고 있는 IP (Internet Protocol)이다.

### 전송 계층 (Transport Layer)
네트워크 계층에서 IP를 통해서 노드에서 노드까지의 전송이 되었다. 하지만 일반적인 네트워크 소프트웨어들은 클라이언트와 서버로 나뉘어지며, 클라이언트가 요청한 데이터에 대한 서버의 응답을 다시 같은 노드의 수많은 application중 해당 클라이언트가 받을수 있어야 할것이다. 전송 계층이 바로 이 역할을 해주며, 우리가 네트워크 과정을 듣게 되면 흔하게 듣는 TCP(혹은 UDP)가 사용된다.
>흔히 네트워크 과정을 공부하다보면 **TCP/IP** 이렇게 합쳐서 부르는 경우가 많다. 하지만 둘은 명백히 다른 계층에서 다른 역할을 한다. 위에서 이야기 한것처럼 IP는 택배를 전달할 때 아파트, 건물에 비교할수 있고 TCP는 특정 호 (201호, 301호)로 이야기 할수있다.

### 어플리케이션 계층 (Application Layer)
다양한 프로토콜들이 존재하며, 우리가 사용하는 어플리케이션에 특화된 계층이다. 브라우저, 이메일, 메신저등 네트워크를 통해서 사용할 수 있는 어플리케이션들이 네트워크에 접근하기 위한 프로토콜을 제공하는 계층이라 보면 된다.

---
# Basic Networking Devices

### 케이블
네트워크 케이블을 만드는데 사용되는 재료로는 동(copper)와 광섬유(fiber)를 많이 사용한다. 가장 일반적인 동을 사용한 케이블은 랜선이라고도 부르는 UTP 케이블일것이다. UTP 케이블은 다시 스펙에 따라서 Cat5, Cat5e, Cat6등으로 나뉠수있으며 각 카테고리에 따라서 전송 속도, 최대 전송 길이, 신호 전달 안정성에 따라서 달라질수있다. Cat5같은 경우에는 **Crosstalk** 문제를 개선하기 위해서 Cat5e, Cat6로 대체가 되었다.
>**Crosstalk** - 서로 인접한 선이 특정 전기 신호를 주고받다가 그 신호가 의도치 않는 다른 선에서 발견되어 네트워크 에러를 일으키는 현상을 말한다.

광섬유(fiber)케이블은 전기신호를 주고 받는 UTP 케이블과는 다르게 빛 신호를 통해서 데이터를 주고받기에 전파 방해가 많은 환경에서 데이터를 주고 받을수가 있다. 일반적으로 UTP 케이블보다 전송 속도가 빠르지만, 가격이 비싸며 망가지기가 쉽다. 그래도 먼거리의 데이터를 손상없이 전달할수 있기때문에 해저 케이블로도 사용되기도 한다.

### 스위치(Switch)와 허브(Hub)