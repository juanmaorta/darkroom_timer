###
	(c) 2012 - Juanma Orta - Coffeescript version
	app.coffee
	+ social.coffee
    + maps.coffee
    + forms.coffee
	DO NOT edit the .js file
###

###global $:false, define:false, require:false, requirejs:false, console:false ###

requirejs.config(
	paths:
        # async: 'libs/requirejs-plugins/async'
        'jquery' : 'lib/jquery-1.8.3.min'
)    


require ['jquery', 'timer', 'util'], (jquery, timer, util) ->
    
    $("input.timedisplay").blur (e) ->
        # $(@).val(util.zerofill($(@).val()) 
        $(@).val(util.zerofill($(@).val()))

    $(".timer_start").click (e) ->
        e.preventDefault()
        timer_field = $(@).attr("data-rel")

        lapses = $("input[data-rel="+timer_field+"]")
        for lapse in lapses
            _time = parseInt($(lapse).val(), 10)
            if $(lapse).attr("name") is "minutes"
                _minutes = _time
                m_field = lapse
            else if $(lapse).attr("name") is "seconds"
                _seconds = _time
                s_field = lapse

        if timer.count(_minutes, _seconds, "down", m_field, s_field)
            $(@).html("Pause <i class=\"icon-pause icon-white\"></i>").removeClass("btn-success").addClass("btn-danger")


    return false