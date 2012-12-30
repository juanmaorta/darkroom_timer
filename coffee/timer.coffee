###
Timer
timer.coffee
(c) 2012 - Juanma Orta - Coffeescript version
DO NOT edit the .js file
###
###global $:false, console:false, define:false, alert:false ###


define ['jquery', 'util'], (jquery, util) ->
	_mins = 0
	_secs = 0
	_counter = null
	_secs_field = null
	_mins_field = null

	_countdown = () ->
		
		# timer logic
		if _mins > 0 and _secs is 0
			_secs = 59
			_mins = _mins - 1
		
		_secs = _secs - 1

		$(_mins_field).val(util.zerofill(_mins))
		$(_secs_field).val(util.zerofill(_secs))
		

		if _secs <= 0 and _mins <= 0
			clearInterval(_counter)

		return

	return {

		count: (minutes, seconds, direction, mins_field, secs_field) ->
			if minutes > 0 or seconds > 0
				_mins = minutes
				_secs = seconds
				_mins_field = mins_field
				_secs_field = secs_field
				_counter = setInterval(_countdown, 1000)
				return true
			else
				return false

	}