#!/usr/bin/env ruby
require 'google_hash'

a = GoogleHashSparseLongToLong.new
a[13511354] = 513513513
a[3151511] = 213515
a[35151511] = 1
puts Marshal.load(a.dump_as_hash(nil)).inspect

a = GoogleHashSparseRubyToLong.new
a[["shit","fuck"]] = 123445
a[["omg", "wtf"]] = 54321
a["wtf"] = 1
puts Marshal.load(a.dump_as_hash(nil)).inspect

a = GoogleHashSparseRubyToRuby.new
a[1234] = GoogleHashSparseLongToLong.new
a[1234][4321] = 1
puts Marshal.load(a.dump_as_hash(nil)).inspect

a = GoogleHashSparseLongToRuby.new
a[1234] = GoogleHashSparseRubyToLong.new
a[1234]["wtf"] = 1
puts Marshal.load(a.dump_as_hash(nil)).inspect

a = GoogleHashSparseLongToRuby.new
a[1234] = GoogleHashSparseLongToLong.new
a[1234][5678] = 1
puts Marshal.load(a.dump_as_hash(nil)).inspect

f = File.open("test.dump", "w")
a.dump_as_hash(f)
f.close

puts Marshal.load(open("test.dump").read).inspect
