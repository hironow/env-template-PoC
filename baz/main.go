package main

import (
	"fmt"
	"log"

	"github.com/kelseyhightower/envconfig"
)

type Config struct {
	One   string
	Two   int
	Three float64
}

func main() {
	var c Config
	err := envconfig.Process("baz", &c)
	if err != nil {
		log.Fatal("envconfig process failed")
	}

	if c.One != "" {
		fmt.Println("Config.One configured")
	}
	if c.Two != 0 {
		fmt.Println("Config.Two configured")
	}
	if c.Three != 0.0 {
		fmt.Println("Config.Three configured")
	}

}
