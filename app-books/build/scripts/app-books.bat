@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  app-books startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and APP_BOOKS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\app-books.jar;%APP_HOME%\lib\helidon-microprofile-tracing-3.1.0.jar;%APP_HOME%\lib\helidon-microprofile-openapi-3.1.0.jar;%APP_HOME%\lib\helidon-microprofile-server-3.1.0.jar;%APP_HOME%\lib\helidon-microprofile-rest-client-3.1.0.jar;%APP_HOME%\lib\helidon-integrations-openapi-ui-3.1.0.jar;%APP_HOME%\lib\helidon-tracing-jaeger-3.1.0.jar;%APP_HOME%\lib\helidon-integrations-cdi-jta-weld-3.1.0.jar;%APP_HOME%\lib\helidon-integrations-cdi-hibernate-3.1.0.jar;%APP_HOME%\lib\helidon-integrations-cdi-jpa-3.1.0.jar;%APP_HOME%\lib\jersey-media-json-binding-3.0.8.jar;%APP_HOME%\lib\postgresql-42.5.1.jar;%APP_HOME%\lib\HikariCP-5.0.1.jar;%APP_HOME%\lib\helidon-webserver-static-content-3.1.0.jar;%APP_HOME%\lib\helidon-webserver-jersey-3.1.0.jar;%APP_HOME%\lib\helidon-openapi-3.1.0.jar;%APP_HOME%\lib\helidon-service-common-rest-3.1.0.jar;%APP_HOME%\lib\helidon-webserver-cors-3.1.0.jar;%APP_HOME%\lib\helidon-webserver-3.1.0.jar;%APP_HOME%\lib\helidon-microprofile-config-3.1.0.jar;%APP_HOME%\lib\helidon-config-encryption-3.1.0.jar;%APP_HOME%\lib\helidon-common-key-util-3.1.0.jar;%APP_HOME%\lib\helidon-tracing-jersey-3.1.0.jar;%APP_HOME%\lib\helidon-tracing-jersey-client-3.1.0.jar;%APP_HOME%\lib\helidon-webclient-jaxrs-3.1.0.jar;%APP_HOME%\lib\helidon-common-configurable-3.1.0.jar;%APP_HOME%\lib\helidon-microprofile-cdi-3.1.0.jar;%APP_HOME%\lib\helidon-tracing-opentelemetry-3.1.0.jar;%APP_HOME%\lib\helidon-microprofile-tests-junit5-3.1.0.jar;%APP_HOME%\lib\helidon-jersey-client-3.1.0.jar;%APP_HOME%\lib\helidon-media-jsonp-3.1.0.jar;%APP_HOME%\lib\helidon-media-common-3.1.0.jar;%APP_HOME%\lib\helidon-common-http-3.1.0.jar;%APP_HOME%\lib\helidon-tracing-config-3.1.0.jar;%APP_HOME%\lib\helidon-common-context-3.1.0.jar;%APP_HOME%\lib\helidon-tracing-tracer-resolver-3.1.0.jar;%APP_HOME%\lib\helidon-tracing-opentracing-3.1.0.jar;%APP_HOME%\lib\helidon-tracing-3.1.0.jar;%APP_HOME%\lib\helidon-config-yaml-mp-3.1.0.jar;%APP_HOME%\lib\helidon-config-mp-3.1.0.jar;%APP_HOME%\lib\helidon-logging-common-3.1.0.jar;%APP_HOME%\lib\helidon-config-yaml-3.1.0.jar;%APP_HOME%\lib\helidon-config-testing-3.1.0.jar;%APP_HOME%\lib\helidon-config-object-mapping-3.1.0.jar;%APP_HOME%\lib\helidon-config-3.1.0.jar;%APP_HOME%\lib\helidon-common-media-type-3.1.0.jar;%APP_HOME%\lib\helidon-common-reactive-3.1.0.jar;%APP_HOME%\lib\helidon-common-mapper-3.1.0.jar;%APP_HOME%\lib\helidon-common-service-loader-3.1.0.jar;%APP_HOME%\lib\jersey-mp-rest-client-3.0.8.jar;%APP_HOME%\lib\jersey-weld2-se-3.0.8.jar;%APP_HOME%\lib\weld-jta-4.0.2.Final.jar;%APP_HOME%\lib\weld-se-core-3.1.0.jar;%APP_HOME%\lib\weld-spi-4.0.SP1.jar;%APP_HOME%\lib\weld-api-4.0.SP1.jar;%APP_HOME%\lib\jakarta.enterprise.cdi-api-3.0.0.jar;%APP_HOME%\lib\jakarta.interceptor-api-2.0.0.jar;%APP_HOME%\lib\helidon-jersey-server-3.1.0.jar;%APP_HOME%\lib\jersey-hk2-3.0.8.jar;%APP_HOME%\lib\helidon-jersey-media-jsonp-3.1.0.jar;%APP_HOME%\lib\jersey-media-json-processing-3.0.8.jar;%APP_HOME%\lib\jersey-server-3.0.8.jar;%APP_HOME%\lib\jersey-client-3.0.8.jar;%APP_HOME%\lib\jersey-common-3.0.8.jar;%APP_HOME%\lib\helidon-integrations-cdi-jta-3.1.0.jar;%APP_HOME%\lib\narayana-jta-jakarta-5.12.0.Final.jar;%APP_HOME%\lib\jboss-transaction-spi-jakarta-7.6.1.Final.jar;%APP_HOME%\lib\jakarta.resource-api-2.0.0.jar;%APP_HOME%\lib\jakarta.annotation-api-2.0.0.jar;%APP_HOME%\lib\hibernate-core-6.1.4.Final.jar;%APP_HOME%\lib\jersey-media-sse-3.0.8.jar;%APP_HOME%\lib\jakarta.inject-api-2.0.1.jar;%APP_HOME%\lib\jersey-cdi1x-3.0.8.jar;%APP_HOME%\lib\jakarta.ws.rs-api-3.0.0.jar;%APP_HOME%\lib\yasson-2.0.4.jar;%APP_HOME%\lib\jakarta.json.bind-api-2.0.0.jar;%APP_HOME%\lib\jakarta.persistence-api-3.0.0.jar;%APP_HOME%\lib\jakarta.transaction-api-2.0.0.jar;%APP_HOME%\lib\jakarta.el-4.0.2.jar;%APP_HOME%\lib\hibernate-validator-cdi-7.0.2.Final.jar;%APP_HOME%\lib\flyway-core-9.11.0.jar;%APP_HOME%\lib\helidon-jersey-common-3.1.0.jar;%APP_HOME%\lib\helidon-common-crypto-3.1.0.jar;%APP_HOME%\lib\helidon-common-3.1.0.jar;%APP_HOME%\lib\helidon-integrations-cdi-reference-counted-context-3.1.0.jar;%APP_HOME%\lib\helidon-integrations-cdi-delegates-3.1.0.jar;%APP_HOME%\lib\helidon-integrations-jta-jdbc-3.1.0.jar;%APP_HOME%\lib\helidon-integrations-jdbc-3.1.0.jar;%APP_HOME%\lib\opentelemetry-exporter-jaeger-1.15.0.jar;%APP_HOME%\lib\jackson-jr-objects-2.14.0.jar;%APP_HOME%\lib\smallrye-open-api-jaxrs-2.1.16.jar;%APP_HOME%\lib\smallrye-open-api-core-2.1.16.jar;%APP_HOME%\lib\jackson-dataformat-yaml-2.14.0.jar;%APP_HOME%\lib\jackson-core-2.14.0.jar;%APP_HOME%\lib\jackson-dataformat-toml-2.14.0.jar;%APP_HOME%\lib\jackson-databind-2.14.0.jar;%APP_HOME%\lib\jackson-annotations-2.14.0.jar;%APP_HOME%\lib\opentelemetry-sdk-1.15.0.jar;%APP_HOME%\lib\opentelemetry-opentracing-shim-1.15.0-alpha.jar;%APP_HOME%\lib\opentelemetry-sdk-logs-1.15.0-alpha.jar;%APP_HOME%\lib\opentelemetry-sdk-trace-1.15.0.jar;%APP_HOME%\lib\opentelemetry-sdk-metrics-1.15.0.jar;%APP_HOME%\lib\opentelemetry-sdk-common-1.15.0.jar;%APP_HOME%\lib\opentelemetry-exporter-otlp-common-1.15.0.jar;%APP_HOME%\lib\opentelemetry-semconv-1.15.0-alpha.jar;%APP_HOME%\lib\opentelemetry-extension-trace-propagators-1.15.0.jar;%APP_HOME%\lib\opentelemetry-api-1.15.0.jar;%APP_HOME%\lib\opentelemetry-context-1.15.0.jar;%APP_HOME%\lib\opentracing-util-0.33.0.jar;%APP_HOME%\lib\opentracing-tracerresolver-0.1.8.jar;%APP_HOME%\lib\opentracing-noop-0.33.0.jar;%APP_HOME%\lib\opentracing-api-0.33.0.jar;%APP_HOME%\lib\jaxb-impl-3.0.2.jar;%APP_HOME%\lib\jaxb-core-3.0.2.jar;%APP_HOME%\lib\jaxb-runtime-3.0.2.jar;%APP_HOME%\lib\jaxb-core-3.0.2.jar;%APP_HOME%\lib\jakarta.xml.bind-api-3.0.1.jar;%APP_HOME%\lib\jakarta.el-api-4.0.0.jar;%APP_HOME%\lib\parsson-1.0.2.jar;%APP_HOME%\lib\jakarta.json-api-2.0.2.jar;%APP_HOME%\lib\jakarta.activation-api-2.0.1.jar;%APP_HOME%\lib\parsson-media-1.0.2.jar;%APP_HOME%\lib\netty-codec-http-4.1.86.Final.jar;%APP_HOME%\lib\netty-handler-4.1.86.Final.jar;%APP_HOME%\lib\netty-codec-4.1.86.Final.jar;%APP_HOME%\lib\netty-transport-native-unix-common-4.1.86.Final.jar;%APP_HOME%\lib\netty-transport-4.1.86.Final.jar;%APP_HOME%\lib\netty-buffer-4.1.86.Final.jar;%APP_HOME%\lib\snakeyaml-1.33.jar;%APP_HOME%\lib\microprofile-config-api-3.0.1.jar;%APP_HOME%\lib\microprofile-opentracing-api-3.0.jar;%APP_HOME%\lib\microprofile-rest-client-api-3.0.jar;%APP_HOME%\lib\microprofile-openapi-api-3.0.jar;%APP_HOME%\lib\jandex-2.4.3.Final.jar;%APP_HOME%\lib\slf4j-jdk14-1.7.32.jar;%APP_HOME%\lib\slf4j-api-1.7.32.jar;%APP_HOME%\lib\hibernate-validator-7.0.2.Final.jar;%APP_HOME%\lib\jakarta.validation-api-3.0.0.jar;%APP_HOME%\lib\weld-environment-common-4.0.2.Final.jar;%APP_HOME%\lib\jboss-classfilewriter-1.2.5.Final.jar;%APP_HOME%\lib\jboss-logging-3.4.3.Final.jar;%APP_HOME%\lib\reactive-streams-1.0.4.jar;%APP_HOME%\lib\netty-resolver-4.1.86.Final.jar;%APP_HOME%\lib\netty-common-4.1.86.Final.jar;%APP_HOME%\lib\okhttp-4.9.3.jar;%APP_HOME%\lib\okio-jvm-2.8.0.jar;%APP_HOME%\lib\junit-platform-commons-1.7.0.jar;%APP_HOME%\lib\junit-jupiter-api-5.7.0.jar;%APP_HOME%\lib\hamcrest-all-1.3.jar;%APP_HOME%\lib\checker-qual-3.5.0.jar;%APP_HOME%\lib\smallrye-open-api-ui-2.1.16.jar;%APP_HOME%\lib\hibernate-commons-annotations-6.0.2.Final.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\byte-buddy-1.12.9.jar;%APP_HOME%\lib\antlr4-runtime-4.10.1.jar;%APP_HOME%\lib\jakarta.activation-2.0.1.jar;%APP_HOME%\lib\osgi-resource-locator-1.0.3.jar;%APP_HOME%\lib\jakarta.json-2.0.0-module.jar;%APP_HOME%\lib\weld-core-impl-3.1.0.jar;%APP_HOME%\lib\hk2-locator-3.0.3.jar;%APP_HOME%\lib\javassist-3.28.0-GA.jar;%APP_HOME%\lib\apiguardian-api-1.1.0.jar;%APP_HOME%\lib\opentest4j-1.2.0.jar;%APP_HOME%\lib\hk2-api-3.0.3.jar;%APP_HOME%\lib\aopalliance-repackaged-3.0.3.jar;%APP_HOME%\lib\hk2-utils-3.0.3.jar;%APP_HOME%\lib\kotlin-stdlib-1.4.10.jar;%APP_HOME%\lib\txw2-3.0.2.jar;%APP_HOME%\lib\istack-commons-runtime-4.0.1.jar;%APP_HOME%\lib\kotlin-stdlib-common-1.4.10.jar;%APP_HOME%\lib\annotations-13.0.jar


@rem Execute app-books
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %APP_BOOKS_OPTS%  -classpath "%CLASSPATH%" io.helidon.microprofile.cdi.Main %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable APP_BOOKS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%APP_BOOKS_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
