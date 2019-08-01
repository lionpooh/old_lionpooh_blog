---
layout: post
title:  Docker bridge network
date: 2019-08-01 05:23:27 +0900
categories: [docker]
tags: [docker]
---
일반적인 bridge network와는 다르게 docker에서의 bridge network는 container간의 bridge network를 의미한다. docker의 bridge driver는 host에 자동으로 rule을 정의하여, 서로 다른 bridge network에 속해 있는 container간의 연결을 제한한다.
<!--more-->

bridge network는 같은 docker daemon host의 container에 적용되며, 다른 docker daemon host에 있는 container에 접근하려면, OS 레벨에서 routing을 건들거나, `docker overlay network`를 이용해야한다.

docker는 기본적으로 default bridge network (`bridge`) 를 만들어 놓고 사용하고 있으며, container를 만들때 network를 지정하지 않으면 `bridge`에 연결이 된다. 또한 bridge network는 직접 만들어서 사용할 수 있고, 생성된 bridge network (직접 생성한) 는 default `bridge` network보다 더 높은 우선권을 가지게 된다.

### **User-defined bridge network와 default bridge network의 차이점**
- **User-defined (사용자 정의) bridge는 containerized application간에 더 나은 격리와 상호 운영성을 제공해준다.**  

  같은 user-defined bridge network에 연결되어 있는 container는 자동으로 서로 모든 port를 열어두며, network 외부로의 port연결은 막아둔다. 이로인해 containerized application들은 외부와의 연결은 차단하고, 내부의 연결은 별도의 설정없이 연결이 가능해진다.

  예를들어 front-end/web, back-end/database로 구성된 application을 docker위에 구성하려고 할때, front-end는 사용자들이 접근할수있도록 바깥에 노출되어 있을것이고, (일반적인 80 port를 통해서) back-end의 경우에는 application만이 database의 host, port에 접근할수있어야 할 것이다. user-defined bridge network를 이용한다면, web port만 열어놓고, database의 port는 열어둘 필요가 없다.

  위와 같은 구성을 default bridge network로 하려면, web port와 database port를 둘다 열어주어야 하며, (`-p` 혹은 `--publish` flag) database에 대한 접근을 docker host에서 다시 막아주어야 하는 번거로움이 발생하게 된다.

- **User-defined bridge는 container간의 automatic DNS resolution을 제공해준다.**

  default bridge network 위에 있는 container들은 ip address를 통해서 접근하거나, lagacy option인 `--link`를 통해서 접근 가능하다. user-defined bridge network에서는 container간에 이름 혹은 별칭으로 접근이 가능해진다.

  위에서 예를든 환경에서의 web container를 `web` database container를 `db`라고 이름을 짓는다면, 단순히 `db`라는 이름만으로 `web` container에서 database로 연결이 가능해진다.

  default bridge network에서 위의 환경을 구성하려면, ``--link`` option을 사용해서 각 container에 설정을 해주어야 하며, container의 숫자가 늘어나면 늘어날수록 설정은 점점 복잡해질것이다. 다른 방법으론 container의 `/etc/hosts` 파일을 수정할수도 있겠지만 이 방법은 문제가 발생했을때 debug가 힘들어질것이다.

- **User-defined network에 container 연결을 자유롭게 설정할수 있다.**

  container가 살아있는 동안에 user-defined network에 접속 혹은 끊을수 있으며, 만약 default bridge network에 연결되어 있는 container가 연결을 끊으려고 한다면, container를 멈추고 다른 network option을 주어서 다시 만들어주어야 한다.

- **각 User-defined network마다 다른 bridge 설정을 줄수가 있다.**

  만약 default bridge network의 설정을 바꾸려고 한다면, 사용중인 모든 container 역시 같은 설정을 따를 것이다. (`MTU`, `iptables`의 rule들) 그리고 default bridge network의 설정을 적용하려면 docker의 재시작도 필요하다.

  user-defined bridge network는 `docker network create`를 통해서 생성되며, 만약 어떠한 그룹의 application이 다른 network 설정이 필요하다면, 위의 명령어로 새로 만들어 분리하면 된다.

- **Default bridge network위에 `Linked` container들은 환경변수를 공유한다.**

  container간의 환경변수를 공유하려면, 두 container를 `--link` flag를 통해서 연결해주어야 한다. 이 방법은 user-defined network에서는 사용이 불가능하다. 하지만 아래와 같은 더 나은 방법으로 환경변수를 공유 가능하다.
  - docker volume을 이용해서 다수의 container들을 공유할 정보가 담긴 file, directory를 mount를 통해 정보를 공유

  - `docker-compose`를 사용하여 여러 container를 동시에 시작할때 compose file 이란 것을 이용해서 공유 변수를 정의

  - docker 단독으로 container를 사용하는 것이 아니라, swarm 서비스를 이용해서 secret과 config들을 공유 가능하다.

### **참조 링크**
- [docker document - Use bridge networks][docker-bridge]
  - 위의 내용을 번역

[docker-bridge]: https://docs.docker.com/network/bridge/
