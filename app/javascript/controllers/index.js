// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CardTextController from "./card_text_controller"
application.register("card-text", CardTextController)

import CarouselController from "./carousel_controller"
application.register("carousel", CarouselController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SidebarController from "./sidebar_controller"
application.register("sidebar", SidebarController)
