// Generated by CoffeeScript 1.6.3
(function() {
  window.spinner = function(enter, exit, next_transition) {
    var chain, my, selection, spinning;
    spinning = false;
    selection = null;
    my = {};
    my.start = function() {
      spinning = true;
      selection = enter();
      return chain();
    };
    my.stop = function() {
      spinning = false;
      return exit(selection);
    };
    chain = function() {
      if (spinning) {
        return next_transition(selection).each('end', chain);
      }
    };
    return my;
  };

}).call(this);
