<!DOCTYPE html>
<html ng-app="app">
<head>
    <!-- LIBS CSS -->
    <link rel="stylesheet" href="webjars/bootstrap/${bootstrap.version}/css/bootstrap.css">
    <style>
        .thumb {
            width: 24px;
            height: 24px;
            float: none;
            position: relative;
        }
    </style>
    <!-- LIBS JS -->
    <script src="webjars/angularjs/${angularjs.version}/angular.js"></script>
    <script src="webjars/angularjs/${angularjs.version}/angular-resource.js"></script>
    <script src="webjars/angularjs/${angularjs.version}/angular-animate.js"></script>
    <script src="webjars/angular-ui-bootstrap/${angular-ui-bootstrap.version}/ui-bootstrap-tpls.js"></script>
    <script src="webjars/ng-file-upload/${ng-file-upload.version}/ng-file-upload.js"></script>
    <!-- YOUR JS -->
    <script src="app.js"></script>
</head>
<body>
<div class="container">

    <!-- FILES -->

    <form ng-controller="FilesCtrl">
        <h1>Files</h1>
        <p>Multiples Files, Progress Bars</p>
        <!-- BROWSE -->
        <div class="form-group">
            <button class="btn btn-primary"
                    ngf-select="uploadFiles($files)"
                    multiple
                    accept="*">
                <i class="glyphicon glyphicon-folder-open"></i>&nbsp;&nbsp;Browse Files
            </button>
        </div>
        Files:
        <div class="uploadedfile" ng-repeat="f in files" style="font:smaller">
            <!-- FILE -->
            <i class="glyphicon glyphicon-file"></i><span ng-class="{removed: f.removed}">{{f.name}} {{f.$errorParam}}</span>
            <!-- PROGRESS -->
            <div class="progress" ng-show="f.progress >= 0">
                <div class="progress-bar progress-bar-success" role="progressbar"
                     aria-valuenow="{{f.progress}}" aria-valuemin="0" aria-valuemax="100"
                     style="width: {{f.progress}}%">
                    <span class="sr-only">{{f.progress}}% Complete</span> {{f.progress}}%
                </div>
            </div>
        </div>
        {{errorMsg}}
        <!-- PREVIEW -->
        <div class="form-group">
            <img class="thumb"
                 ng-show="myForm.file.$valid"
                 ngf-thumbnail="picFile">
            <button class="btn btn-danger btn-xs"
                    ng-click="picFile = null"
                    ng-show="picFile">
                <i class="glyphicon glyphicon-remove"></i> Remove
            </button>
        </div>
    </form>

</div>
</body>
</html>