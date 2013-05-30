Bsh = Ember.Application.createWithMixins({
  LOG_TRANSITIONS: true,
  authStateBinding: 'auth.State',
  rootElement: '#root',
  hasFocus: true,
  scrolling: false,
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

    console.log('bla');
    $html = $('html');
    $(window).focus((function() {
      Bsh.set('hasFocus', true);
      return Bsh.set('notify', false);
    }).blur(function() {
      return Bsh.set('hasFocus', false);
    }));
    csrfToken = $('meta[name=csrf-token]').attr('content');
    $.ajaxPrefilter(function(options, originalOptions, xhr) {
      if (!options.crossDomain) {
        return xhr.setRequestHeader('X-CSRF-Token', csrfToken);
      }
    });
    return $('#root').on('click', 'a', function(e) {
      var currentTarget, href;

      if (e.isDefaultPrevented() || e.shiftKey || e.metaKey || e.ctrlKey) {
        return;
      }
      currentTarget = $(e.currentTarget);
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
      if (href.indexOf("mailto" === 0)) {
        return;
      }
      if (href.match(/^http[s]?:\/\//i) && !href.match(new RegExp("^http:\\/\\/" + window.location.hostname, "i"))) {
        return;
      }
      e.preventDefault();
      console.log('route');
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
    return Bsh.loadDomEvents();
  }
});

Bsh.Router = Ember.Router.extend();

Bsh.Router.reopen({
  location: 'history'
});

