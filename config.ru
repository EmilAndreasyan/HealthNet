require_relative './config/environment'

require 'sass/plugin/rack'

use Sass::Plugin::Rack
use Rack::MethodOverride
use UsersController
use DiseasesController
use DrugsController
use PatientsController
use SessionsController
run ApplicationController