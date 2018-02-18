<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="test-app" ng-strict-di>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angular_material/0.8.3/angular-material.min.css">
    <!-- build:css mfb.css -->
    <link href="../mfb/dist/mfb.css" rel="stylesheet"/>
    <!-- endbuild -->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/3.0.1/normalize.min.css">
    <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link href='http://fonts.googleapis.com/css?family=Raleway:100,200,300,400' rel='stylesheet' type='text/css'>

    <!-- build:js modernizr.touch.js -->
    <script type="text/javascript" src="../mfb/dist/lib/modernizr.touch.js"></script>
    <!-- endbuild -->

    <!-- build:css index.css -->
    <link href="../mfb/demo/index.css" rel="stylesheet">
    <!-- endbuild -->

    <title>Material floating button. The index.</title>
  </head>
  <body ng-controller="myCtrl as ctrl" ng-init="demoPage = 'core'">

    <nav mfb-menu position="{{ctrl.chosen.position}}" effect="{{ctrl.chosen.effect}}"
         active-icon="ion-close-round" resting-icon="ion-plus-round"
         ng-mouseenter="hovered()" ng-mouseleave="hovered()"
         toggling-method="{{ctrl.chosen.method}}" menu-state="ctrl.menuState" main-action="ctrl.mainAction()">
      <button mfb-button icon="{{button.icon}}" ng-click="ctrl.loc(button.href)"
         label="{{button.label}}" ng-repeat="button in ctrl.buttons"></button>
    </nav>


    <section id="panel" class="panel" ng-include=" 'demo-card.html' "></section>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.6/angular.js"></script>
  <script>!window.angular && document.write(unescape('%3Cscript src="../bower_components/angularjs/angular.js"%3E%3C/script%3E'))</script>

  <!-- ng-mfb core -->
  <!-- build:js mfb-directive.js -->
  <script src="../src/mfb-directive.js"></script>
  <!-- endbuild -->

  <script src="demo-module.js"></script>
  <script>

  var demo = angular.module('demo', ['ng-mfb']);

  demo.controller('myCtrl', Ctrl);

  function Ctrl(defaultValues, $window){
    var vm = this;

    vm.positions = defaultValues.positions;
    vm.effects = defaultValues.effects;
    vm.methods = defaultValues.methods;
    vm.actions = defaultValues.actions;

    vm.menuState = 'closed';
    vm.loc = loc;
    vm.setMainAction = setMainAction;
    vm.mainAction = mainAction;

    vm.chosen = {
      effect : 'zoomin',
      position : 'br',
      method : 'click',
      action : 'fire'
    };

    vm.buttons = [{
      label: 'View on Github',
      icon: 'ion-social-github',
      href: 'https://github.com/nobitagit/ng-material-floating-button/'
    },{
      label: 'Follow me on Github',
      icon: 'ion-social-octocat',
      href: 'https://github.com/nobitagit'
    },{
      label: 'Share on Twitter',
      icon: 'ion-social-twitter',
      href: 'http://twitter.com/share?text=Amazing material floating action button directive!&url=http://nobitagit.github.io/ng-material-floating-button/&hashtags=angular,material,design,button'
    }];

    function loc(href) {
      $window.location.href = href;
    }

    function mainAction() {
      //console.log('Firing Main Action!');
    }

    function setMainAction() {
      if(vm.chosen.action === 'fire') {
        vm.mainAction = mainAction;
      } else {
        vm.mainAction = null;
      }
    }
  }

  Ctrl.prototype.hovered = function() {
    // toggle something on hover.
  };

  Ctrl.prototype.toggle = function() {
    this.menuState = this.menuState === 'closed' ? 'open' : 'closed';
  };

  Ctrl.prototype.closeMenu = function() {
    this.menuState = 'closed';
  };

  Ctrl.$inject = ['defaultValues', '$window'];

  </script>
  <!-- @include ga.html -->
  </body>
</html>
