# Amazon S3 with Spring Cloud

**Amazon S3** 는 Amazon Simple Storage Service의 약자이며, 인터넷용 스토리지 서비스이며, 아래의 두가지 요소로 구성이 된다.
- **버켓**(bucket)은 객체의 컨테이너 역할을 하며, 모든 객체는 어떠한 버켓에 속하게 된다.
> 버켓을 생상할 때 리전(region)을 정의 할 수 있으며, 리전에 생성된 객체는 그 범위를 벗어날 수 없다.
- **객체**(object - 사진, 동영상등의 파일)는 S3의 기본 개체이며, 데이터와 메타 데이터로 구성된다.  

보다 자세한 내용은 여기를 참조

**Spring Cloud for AWS** 는 Spring Cloud umbrella 프로젝트로, AWS Java SDK기반으로, S3뿐만 아니라 다양한 AWS에서 제공하는 자원들을 쉽게 연동하게 해주며, AWS에서 제공해주는 서비스를 Spring Framework위에서 개발할 수 있게해준다. 이점은 개발자로 하여금 infrastructure와의 연동은 spring에게 맡기고 온전히 서비스 로직에만 집중하게 해준다.


##### spring starter 설정

```xml
<dependency>
  <groupId>org.springframework.cloud</groupId>
  <artifactId>spring-cloud-starter-aws</artifactId>
  <version></version>
</dependency>
```
spring boot를 사용하는 가장 큰 장점 이라고 생각된다. 이 설정 하나로 aws sdk를 스프링 위에서 별도의 코드를 더 작성할 필요 없이 단순히 설정값만 작성해주면된다.
##### AWS config 설정

```yaml
cloud:
  aws:
    credentials:
      access-key: AKIAIJNKZZ3ALKLGPE3Q
      secret-key: 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
    region:
      static: ap-northeast-1
    stack:
      auto: false
```
위와 같이 설정값을 작성해주면 stater를 통해서 aws 서비스를 이용하기 위한 bean들이 세팅된다.
