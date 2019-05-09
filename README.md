# Udp Test module .jl
Julia Programming PhD Test.

[![Coverage Status](https://coveralls.io/repos/github/piebat/UdpTest.jl/badge.svg)](https://coveralls.io/github/piebat/UdpTest.jl)
[![codecov](https://codecov.io/gh/piebat/UdpTest.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/piebat/UdpTest.jl)

| **Documentation** | **Build Status** |
|---------------|--------------|
|[![][docs-stable-img]][docs-stable-url] <br/> [![][docs-latest-img]][docs-dev-url] | [![Build Status][travis-img]][travis-url]

## How to Use
This code is just to demostrate the porting from a Python
[Udp-Test](https://github.com/appstore-zencore/udp-test) module to a Julia one, with CI use.
The Module itself is very simple.
You can run a Server and a Client on same or different machine.
The client application will require to insert a message that will be sent to the server, and will show the server replay.

## Documentation

- [**STABLE**][docs-stable-url] &mdash; **documentation of the most recently tagged version.**
- [**DEV**][docs-dev-url] &mdash; **documentation of the development version.**

[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-stable-img]: https://img.shields.io/badge/docs-stable-blue.svg
[docs-dev-url]: https://piebat.github.io/UdpTest.jl/dev
[docs-stable-url]: https://piebat.github.io/UdpTest.jl/stable

[travis-img]: https://travis-ci.org/piebat/UdpTest.jl.svg?branch=master
[travis-url]: https://travis-ci.org/piebat/UdpTest.jl
