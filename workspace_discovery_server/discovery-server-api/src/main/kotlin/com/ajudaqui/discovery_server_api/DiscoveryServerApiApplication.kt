package com.ajudaqui.discovery_server_api

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer

@SpringBootApplication @EnableEurekaServer class DiscoveryServerApiApplication
fun main(args: Array<String>) {
  runApplication<DiscoveryServerApiApplication>(*args)
}
