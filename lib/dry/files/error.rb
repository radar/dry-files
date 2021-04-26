# frozen_string_literal: true

module Dry
  class Files
    # Dry::Files base error
    #
    # @since 0.1.0
    # @api public
    class Error < StandardError
    end

    # Wraps low level I/O errors
    #
    # @see https://ruby-doc.org/core/Errno.html
    #
    # @since 0.1.0
    # @api public
    class IOError < Error
      # Instantiate a new `Dry::Files::IOError`
      #
      # @param cause [Exception] the low level exception
      #
      # @return [Dry::Files::IOError] the new error
      #
      # @since 0.1.0
      # @api private
      def initialize(cause)
        super(cause.message)
        @_cause = cause
      end

      # The original exception
      #
      # @see https://ruby-doc.org/core/Exception.html#method-i-cause
      #
      # @since 0.1.0
      # @api public
      def cause
        @_cause
      end
    end

    # File manipulations error.
    # Raised when the given `target` cannot be found in `path`.
    #
    # @since 0.1.0
    # @api public
    class MissingTargetError < Error
      # @param target [String,Regexp] the missing target
      # @param path [String,Pathname] the file
      #
      # @return [Dry::Files::MissingTargetError] the new error
      #
      # @since 0.1.0
      # @api private
      def initialize(target, path)
        super("Cannot find `#{target}' in `#{path}'")

        @_target = target
        @_path = path
      end

      # The missing target
      #
      # @return [String, Regexp] the missing target
      #
      # @since 0.1.0
      # @api public
      def target
        @_target
      end

      # The missing target
      #
      # @return [String,Pathname] the file
      #
      # @since 0.1.0
      # @api public
      def path
        @_path
      end
    end
  end
end
