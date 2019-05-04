using Documenter
using UdpTest

makedocs(
    sitename = "UdpTest",
    format = :html,
    modules = [UdpTest]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
