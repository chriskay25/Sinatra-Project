require './config/env'

use Rack::MethodOverride
use UserController
use MoviesController

run ApplicationController