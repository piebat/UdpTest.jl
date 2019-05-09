using Test, UdpTest

@testset "Test 1" begin
#    @test "IPV4 127.0.0.1 : 1883 ==> uno" == show_info("uno", ["127.0.0.1","1883"],"IPV4")
    @test  0 == show_info("uno", ["127.0.0.1","1883"],"IPV4")
    @test_throws DomainError (-1)^0.5
end

@testset "Test 2" begin
#    @test "IPV4 127.0.0.1 : 1883 ==> uno" == show_info("uno", ["127.0.0.1","1883"],"IPV4")
    #@test  0 == server(5050)
    @test_throws MethodError server()
end

@testset "Test 3" begin
    @test_throws MethodError client()
end
