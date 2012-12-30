###
Timer
timer.coffee
(c) 2012 - Juanma Orta - Coffeescript version
DO NOT edit the .js file
###
###global $:false, console:false, define:false, alert:false ###


define [], () ->

	return {

		zerofill: (number) ->
			if parseInt(number, 10) < 10
				return "0"+number
			else
				return parseInt(number, 10)

	}