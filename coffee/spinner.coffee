# A spinner. 
# Takes three parameters:
# enter: a function that optionally creates, and must return, a selection.
# exit: a function to be called when it's time to stop spinning.
#  It takes the selection returned by enter as a parameter. Typically, this 
#  function will make the spinner disappear. But that's up to you.
# next_transition: a function that returns a transition on the
#  selection, and which will be repeatedly invoked until the spinner's
#  stop function is called. It takes a selection as a parameter.
window.spinner = (enter,exit,next_transition) ->

    spinning = false
    selection = null

    my = {}

    my.start = () ->
        spinning = true
        selection = enter()
        chain()

    my.stop = () ->
        spinning = false
        exit(selection)

    chain = () ->
        if spinning
            next_transition(selection).each('end',chain)

    my
