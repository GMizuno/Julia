using DataFrames
using Statistics 
using Pipe: @pipe # Usando @pipe macro
using RDatasets # Pegar datasets do R
using RCall

R"""
flights_tbl = nycflights13::flights

library(dplyr)

delay_r <- flights_tbl %>%
  group_by(tailnum) %>%
  summarise(count = n(), dist = mean(distance), delay = mean(arr_delay)) %>%
  filter(count > 20, dist < 2000, !is.na(delay)) %>%
  collect
"""

@rget flights_tbl delay_r

delay_julia = @pipe flights_tbl |> groupby(_, :tailnum) |> 
    combine(_, :tailnum => length => :Qtd,
             :distance => mean => :dist, :arr_delay => mean => :delay) |> 
    filter(:Qtd => x -> x .> 20, _) |> filter(:dist => y -> y < 2000, _) |> 
    filter(:delay => x -> !ismissing.(x),_)

delay_julia[delay_julia[:tailnum] .== "N102UW", :]
delay_julia[delay_julia[:tailnum] .== "N107US", :]
delay_julia[delay_julia[:tailnum] .== "N105UW", :]
delay_julia[delay_julia[:tailnum] .== "N103US", :]
delay_julia[delay_julia[:tailnum] .== "N108UW", :]
delay_julia[delay_julia[:tailnum] .== "N109UW", :]
head(delay_r)

