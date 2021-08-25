local base = MeowC.base;
local Control = require(base .. ".src.Core.Control");


local Root = Control:extend("Root",{
  coreContainer = {},
  popupContainer = {},
  optionContainer = {},
  tipContainer = {}
});


Root.init = function(self)
  self.super.init(self);
  local lg = love.graphics;
  local width = lg.getWidth();
  local height = lg.getHeight();

  self:setSize(width, height);

  self.coreContainer = Control();
  self.coreContainer:setSize(width, height);
  self:addChild(self.coreContainer, 1);

  self.popupContainer = Control();
  self.popupContainer:setSize(width, height);
  self:addChild(self.popupContainer, 2);

  self.optionContainer = Control();
  self.optionContainer:setSize(width, height);
  self:addChild(self.optionContainer, 3);

  self.tipContainer = Control();
  self.tipContainer:setSize(width, height);
  self:addChild(self.tipContainer,4);

end

Root.resize = function(self, w, h)
  self:setSize(w, h)
  self.coreContainer:setSize(w, h)
  self.popupContainer:setSize(w, h)
  self.optionContainer:setSize(w, h)
  self.tipContainer:setSize(w, h)
end



return Root;
