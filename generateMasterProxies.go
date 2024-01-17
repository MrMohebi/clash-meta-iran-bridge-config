package main

import (
	"fmt"
	"gopkg.in/yaml.v2"
	"net"
	"net/url"
	"os"
	"strconv"
	"strings"
)

type Proxy struct {
	Name     string `yaml:"name"`
	Type     string `yaml:"type"`
	Server   string `yaml:"server"`
	Port     int    `yaml:"port"`
	Username string `yaml:"username"`
	Password string `yaml:"password"`
}

type Proxies struct {
	Proxy []Proxy `yaml:"proxies"`
}

func main() {
	SLAVE_PROXIES := os.Getenv("SLAVE_PROXIES")

	splitFn := func(c rune) bool {
		return c == ','
	}

	slaveProxies := strings.FieldsFunc(SLAVE_PROXIES, splitFn)

	yamlProxies := make([]Proxy, len(slaveProxies))

	for i, proxy := range slaveProxies {
		urlParsed, err := url.Parse(proxy)
		if err != nil {
			panic(err)
		}
		host, port, _ := net.SplitHostPort(urlParsed.Host)
		password, _ := urlParsed.User.Password()
		portInt, err := strconv.Atoi(port)
		if err != nil {
			panic(err)
		}

		yamlProxies[i] = Proxy{
			Name:     host,
			Type:     urlParsed.Scheme,
			Server:   host,
			Port:     portInt,
			Username: urlParsed.User.Username(),
			Password: password,
		}
	}

	yamlData, err := yaml.Marshal(&Proxies{Proxy: yamlProxies})
	if err != nil {
		fmt.Printf("Error while Marshaling. %v", err)
	}

	err = os.WriteFile("slaves-provider.yaml", yamlData, 0644)
	if err != nil {
		panic("Unable to write data into the slaves-provider.yml")
	}
}
