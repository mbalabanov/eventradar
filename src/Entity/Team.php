<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Team
 *
 * @ORM\Table(name="team", indexes={@ORM\Index(name="team-league", columns={"_leagueId"}), @ORM\Index(name="team-category", columns={"_categoryId"})})
 * @ORM\Entity
 */
class Team
{
    /**
     * @var int
     *
     * @ORM\Column(name="teamId", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $teamid;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    private $name;

    /**
     * @var string|null
     *
     * @ORM\Column(name="logoUrl", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $logourl = 'NULL';

    /**
     * @var int|null
     *
     * @ORM\Column(name="leagueRanking", type="integer", nullable=true, options={"default"="NULL"})
     */
    private $leagueranking = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="description", type="text", length=65535, nullable=true, options={"default"="NULL"})
     */
    private $description = 'NULL';

    /**
     * @var \Category
     *
     * @ORM\ManyToOne(targetEntity="Category")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_categoryId", referencedColumnName="categoryId")
     * })
     */
    private $categoryid;

    /**
     * @var \League
     *
     * @ORM\ManyToOne(targetEntity="League")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="_leagueId", referencedColumnName="leagueId")
     * })
     */
    private $leagueid;

    public function getTeamid(): ?int
    {
        return $this->teamid;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getLogourl(): ?string
    {
        return $this->logourl;
    }

    public function setLogourl(?string $logourl): self
    {
        $this->logourl = $logourl;

        return $this;
    }

    public function getLeagueranking(): ?int
    {
        return $this->leagueranking;
    }

    public function setLeagueranking(?int $leagueranking): self
    {
        $this->leagueranking = $leagueranking;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getCategoryid(): ?Category
    {
        return $this->categoryid;
    }

    public function setCategoryid(?Category $categoryid): self
    {
        $this->categoryid = $categoryid;

        return $this;
    }

    public function getLeagueid(): ?League
    {
        return $this->leagueid;
    }

    public function setLeagueid(?League $leagueid): self
    {
        $this->leagueid = $leagueid;

        return $this;
    }


}
