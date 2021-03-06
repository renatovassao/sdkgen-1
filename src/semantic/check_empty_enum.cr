require "./visitor"

module Semantic
  class CheckEmptyEnum < Visitor
    def visit(t : AST::EnumType)
      super
      if t.values.size == 0
        raise SemanticException.new("Enum '#{t.name}' is empty")
      end
    end
  end
end
