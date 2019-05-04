using Documenter
using UdpTest

makedocs(
    sitename = "UdpTest",
    modules = [UdpTest]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com/piebat/udpcstest.jl.git",
    branch = "gh-pages"
)
