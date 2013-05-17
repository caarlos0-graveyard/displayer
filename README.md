# Displayer
### A damn simple browser image slideshow.

## Purpose

Leave it open in a fullscreen browser showing images with relevant info for your
employees, team, or anything else.

## Requirements

- Ruby 1.8.7+ (natively run on Mac OS X default ruby version)

## How to use

```sh
$ git clone https://github.com/caarlos0/displayer.git
$ cd displayer
$ bundle
$ IMGFOLDER=where/are/your/images ruby server.rb
```

Then it should be running in [http://localhost:4567](http://localhost:4567).

## Technology

Simple CSS, HAML, JavaScript served with Sinatra.

> all the code was done in 15 minutes, so, yes, it needs some refactoring.
> pull-requests are welcome.