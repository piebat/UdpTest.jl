using Documenter
using UdpTest

makedocs(
    sitename = "UdpTest",
    format = Documenter.html(),
    modules = [UdpTest]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "https://github.com/piebat/UdpTest.jl.git"
    branch = "gh-pages"
    julia = "1.0.3"
    osname = "linux"
)
