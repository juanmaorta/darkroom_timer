###
Timer
timer.coffee
(c) 2012 - Juanma Orta - Coffeescript version
DO NOT edit the .js file
###
###global $:false, console:false, define:false, alert:false ###


define ['jquery', 'date', 'util'], (jquery, date, util) ->
	_counter = null
	_date = null
	_ref_date = null
	_secs_field = null
	_mins_field = null

	_countdown = () ->
		_date.addSeconds(-1)
		_ref_date.addSeconds(1)

		# display values
		$(_mins_field).val(util.zerofill(_date.getMinutes()))
		$(_secs_field).val(util.zerofill(_date.getSeconds()))
		
		$("#e_min").html(util.zerofill(_ref_date.getMinutes()))
		$("#e_sec").html(util.zerofill(_ref_date.getSeconds()))


		if _date.getSeconds() is 0 and _date.getMinutes() is 0
			clearInterval(_counter)

		return

	return {

		count: (minutes, seconds, direction, mins_field, secs_field) ->
			if minutes > 0 or seconds > 0
				_mins_field = mins_field
				_secs_field = secs_field

				if Date.validateMinute(minutes)  and Date.validateSecond(seconds)
					_date = Date.today().set({ minute: minutes, second: seconds })
					_ref_date = Date.today().set({ minute: 0, second: 0 })
					_counter = setInterval(_countdown, 1000)
					return true
				else
					console.log "seconds or minutes not valid"
					return false
			else
				return false

	}