local ls = require("luasnip")

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.add_snippets(nil, {
    markdown = {
        snip({
            trig = "GHCL",
            name = "Changelog Reference",
            dscr = "Reference to a Consul-K8s pull request for the changelog",
        },
            {
                text("[[GH-"),
                insert(1),
                text("](https://github.com/hashicorp/consul-k8s/pull/"),
                func(
                    function(args)
                        return args[1][1]
                    end,
                    { 1 }
                ),
                text(")]"),
                insert(0),
            }),
    },
    withrespectto = {
        snip({
            trig = "WRT",
            name = "With Respect To",
            dscr = "With respect to",
        },
            {
                text("with respect to"),
            }),
    }
})
