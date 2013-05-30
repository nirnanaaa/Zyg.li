Bsh = Ember.Application.createWithMixins({
  LOG_TRANSITIONS: true,
  authStateBinding: 'auth.State',
  rootElement: '#root',
  hasFocus: true,
  scrolling: false,
  getURL: function(url) {
    if (url.indexOf('http') === 0) return url;
    var u = "/" ;
    if (u[u.length-1] === '/') {
      u = u.substring(0, u.length-1);
    }
    return u + url;
  },
  signedIn: (function() {
    return this.get('authState') === 'signed-in';
  }).property('authState'),
  currentDate: function() {
    return new Date();
  },
  setLocale: function(locale) {
    if (!locale) {
      return;
    }
    I18n.locale = locale;
    return Bsh.set('locale', locale);
  },
  defaultLocale: 'en',
  loadDomEvents: function() {
    var $html, csrfToken;
    $html = $('html');
    csrfToken = $('meta[name=csrf-token]').attr('content');
    $.ajaxPrefilter(function(options, originalOptions, xhr) {
      if (!options.crossDomain) {
        return xhr.setRequestHeader('X-CSRF-Token', csrfToken);
      }
    });
    $("#root").on("click", "a", function(e){
      var target, href;

      if ( e.shiftKey || e.metaKey || e.ctrlKey) {
        return;
      }
      target = $(e.target);
      href = target.attr('href');

      if (!href) {
        return;
      }

      if (href === '#') {
        return;
      }

      if (target.attr('target')) {
        return;
      }

      if (target.hasClass('lightbox')) {
        return;
      }
      if (target.hasClass('ember-view')) {
        return;
      }

      if (href.match(/mailto\:/)) {
        return;
      }
      if (href.match(/^http[s]?:\/\//i) && !href.match(new RegExp("^http:\\/\\/" + window.location.hostname, "i"))) {
        return;
      }

      e.preventDefault();
      return false;
    });
  },
  logout: function() {
    return Bsh.User.logout().then(function() {
      return window.location.reload();
    });
  },
  currentUser: function() {
    return Bsh.User.current();
  },
  start: function() {
    Bsh.loadDomEvents();
  }
});

Bsh.Router = Ember.Router.extend();

Bsh.Router.reopen({
  location: 'history'
});

