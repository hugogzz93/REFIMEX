module NumberFormatHelper
	def format_number(num)
		"#{ "%.4f" % num}"
	rescue => e
		"N/A"
	end
end