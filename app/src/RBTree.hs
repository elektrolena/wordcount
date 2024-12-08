module RBTree (RBTree, buildTree, inOrderTraversal) where

import Data.List (foldl')

data Color = Red | Black deriving (Show, Eq)

data RBTree a
  = Empty
  | Node Color (RBTree a) a (RBTree a)
  deriving (Show, Eq)

-- Inserts an element into the red/black tree
insert :: (Ord a) => a -> RBTree a -> RBTree a
insert x tree = makeBlack (ins tree)
  where
    ins Empty = Node Red Empty x Empty
    ins (Node color left val right)
      | x < val = balance color (ins left) val right
      | x > val = balance color left val (ins right)
      | otherwise = Node color left val right
    makeBlack (Node _ l v r) = Node Black l v r
    makeBlack Empty = Empty

-- Balances the tree after inserting
balance :: Color -> RBTree a -> a -> RBTree a -> RBTree a
balance Black (Node Red (Node Red a x b) y c) z d =
  Node Red (Node Black a x b) y (Node Black c z d)
balance Black (Node Red a x (Node Red b y c)) z d =
  Node Red (Node Black a x b) y (Node Black c z d)
balance Black a x (Node Red (Node Red b y c) z d) =
  Node Red (Node Black a x b) y (Node Black c z d)
balance Black a x (Node Red b y (Node Red c z d)) =
  Node Red (Node Black a x b) y (Node Black c z d)
balance color left val right = Node color left val right

-- 
buildTree :: (Ord a) => [a] -> RBTree a
buildTree = foldl' (flip insert) Empty

-- Inorder-Traversal to create the sorted list
inOrderTraversal :: RBTree a -> [a]
inOrderTraversal Empty = []
inOrderTraversal (Node _ left val right) =
  inOrderTraversal left ++ [val] ++ inOrderTraversal right
