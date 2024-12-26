return {
	"L3MON4D3/LuaSnip",
	build = "make install_jsregexp",
	dependencies = {
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	event = { "InsertEnter" },
	config = function()
		require("luasnip.loaders.from_snipmate").lazy_load()
		local ls = require("luasnip")
		local s = ls.snippet
		local t = ls.text_node
		local i = ls.insert_node
		ls.add_snippets("cpp", {
			s("cppMain", {
				t("#include <bits/stdc++.h>"),
				t({ "", "using namespace std;", "" }),
				t("#define ll long long"),
				t({ "", "#define N 1000000", "" }),
				t("void solve() {"),
				t({ "", "	" }),
				i(1),
				t({ "", "" }),
				t("}"),
				t({ "", "" }),
				t("int main() {"),
				t({ "", "	ios_base::sync_with_stdio(0);" }),
				t({ "", "	cin.tie(0);" }),
				t({ "", "	cout.tie(0);" }),
				t({ "", "	solve();" }),
				t({ "", "}" }),
			}),
		})
	end,
}
