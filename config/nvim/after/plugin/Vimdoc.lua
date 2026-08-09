require("vimdoc").setup({
    sources = {
        nix_any = {
            name = "nixos-anywhere",
            fetcher = "github",
            repo = "nix-community/nixos-anywhere",
            branch = "main",
            doc_path = "docs",
            default_lang = "nix",
            format = "markdown",
            extension = ".md",
        },

        arch = {
            name = "archlinux",
            fetcher = "mediawiki",
            project_url = "https://wiki.archlinux.org",
            endpoint = "/api.php",
            format = "html",
        }

    },
})
