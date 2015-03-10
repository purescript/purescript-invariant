module Data.Functor.Invariant where

-- | A type of functor that can be used to adapt the type of a wrapped function
-- | where the parameterised type occurs in both the positive and negative
-- | position, for example, `F (a -> a)`.
-- |
-- | An `Invariant` instance should satisfy the following laws:
-- |
-- | - Identity: `invmap id id = id`
-- | - Composition: `invmap g1 g2 <<< invmap f1 f2 = invmap (g1 <<< f1) (f2 <<< g2)`
-- |
class Invariant f where
  invmap :: forall a b. (a -> b) -> (b -> a) -> f a -> f b

-- | As all `Functor`s are also trivially `Invariant`, this function can be
-- | used as the `invmap` implementation for all `Invariant` instances for
-- | `Functors`.
invmapF :: forall f a b. (Functor f) => (a -> b) -> (b -> a) -> f a -> f b
invmapF = const <<< (<$>)

instance invariantArr :: Invariant ((->) a) where
  invmap = invmapF
