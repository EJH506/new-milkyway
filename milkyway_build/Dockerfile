# Tomcat 이미지 기반
FROM tomcat:9

# server.xml 파일을 직접 수정한 후 복사
COPY ./server.xml /usr/local/tomcat/conf/server.xml

# context.xml 파일을 복사하여 덮어쓰기
COPY ./context.xml /usr/local/tomcat/conf/context.xml

# WAR 파일을 Tomcat의 webapps 디렉토리로 복사
COPY ./milkyway.war /usr/local/tomcat/webapps/

# Tomcat의 default 포트를 외부에 노출 (기본적으로 8080 포트 사용)
EXPOSE 8080

# Tomcat이 자동으로 실행되도록 CMD 설정
CMD ["catalina.sh", "run"]