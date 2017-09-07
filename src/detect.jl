export prepare, getedge

using PyCall

# https://github.com/dhoegh/Hawk.jl/blob/master/src/Hawk.jl

filename = abspath(joinpath(dirname(@__FILE__), "hed.py"))

@pyimport imp
(path, name) = dirname(filename), basename(filename)
(name, ext) = rsplit(name, '.')

(file, filename, data) = imp.find_module(name, [path])
conv = imp.load_module(name, file, filename, data)


struct EdgeModel
    predictor
end

function prepare(model_path=Pkg.dir("HED","src","HED_pretrained_bsds.npy"); gpu=false)::EdgeModel
    println("model_path ", model_path)
    predictor =conv[:prepare](model_path)
    EdgeModel(predictor)
end

function getedge(m::EdgeModel, image_path, output=nothing)
    conv[:getedge](m.predictor, image_path, output)
end
