return function(use)
    use {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup { default = true }
        end
    }
end
