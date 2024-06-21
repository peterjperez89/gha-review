module "lt" {
   source = "./modules/lt"
   elbsgid = module.elb.elbsgid
}

module "asg" {
  source = "./modules/asg"
  ltid = module.lt.ltid
  ltver = module.lt.ltver
  depends_on = [ module.lt ]
}

module "elb" {
  source = "./modules/elb"
  depends_on = [ module.lt, module.asg ]
}


