module AST
  class Base64PrimitiveType
    def typescript_decode(expr)
      "#{expr}"
    end

    def typescript_encode(expr)
      "#{expr}"
    end

    def typescript_native_type
      "string"
    end

    def typescript_check_encoded(expr, descr)
      String.build do |io|
        io << "if (typeof #{expr} !== \"string\" || !#{expr}.match(/^(?:[A-Za-z0-9+\/]{4}\\n?)*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)$/)) {\n"
        io << "    const err = new Error(\"Invalid Type at '\" + #{descr} + \"'\");\n"
        io << "    setTimeout(() => captureError(err, ctx.req, ctx.call), 1);\n"
        io << "}\n"
      end
    end

    def typescript_check_decoded(expr, descr)
      String.build do |io|
        io << "if (typeof #{expr} !== \"string\" || !#{expr}.match(/^(?:[A-Za-z0-9+\/]{4}\\n?)*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=)$/)) {\n"
        io << "    const err = new Error(\"Invalid Type at '\" + #{descr} + \"'\");\n"
        io << "    setTimeout(() => captureError(err, ctx.req, ctx.call), 1);\n"
        io << "}\n"
      end
    end
  end
end