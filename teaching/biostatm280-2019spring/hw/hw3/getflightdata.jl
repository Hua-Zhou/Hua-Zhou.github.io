using CodecBzip2

for year in 2003:2008
    fn = string(year) * ".csv.bz2"
    @info "download $fn"
    download("http://stat-computing.org/dataexpo/2009/$fn", "./$fn")
    @info "unzip $fn"
    funzip = open(string(year) * ".csv", "w")
    open(Bzip2DecompressorStream, fn) do stream
        write(funzip, stream)
    end
    close(funzip)
end
