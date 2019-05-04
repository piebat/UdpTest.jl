using Test, UdpTest

@testset "Test 1" begin
#    @test "IPV4 127.0.0.1 : 1883 ==> uno" == show_info("uno", ["127.0.0.1","1883"],"IPV4")
    @test  0 == show_info("uno", ["127.0.0.1","1883"],"IPV4")
end;
